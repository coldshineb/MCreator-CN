<#--
This file is part of Fabric-Generator-MCreator.

MCreatorFabricGenerator is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

MCreatorFabricGenerator is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with MCreatorFabricGenerator.  If not, see <https://www.gnu.org/licenses/>.
-->

<#-- @formatter:off -->
<#include "procedures.java.ftl">

package ${package}.item;

import net.fabricmc.api.EnvType;
import net.fabricmc.api.Environment;

public class ${name}Item extends Item {
    public ${name}Item() {
        super(new FabricItemSettings()
                .group(${data.creativeTab})
                .maxCount(${data.stackSize})
                .food((new FoodComponent.Builder()).hunger(${data.nutritionalValue}).saturationModifier(${data.saturation}f)
				<#if data.isAlwaysEdible>.alwaysEdible()</#if>
				<#if data.forDogs>.meat()</#if>
                        .build()
                ));
    }

    <#if data.eatingSpeed != 32>
		@Override
        public int getMaxUseTime(ItemStack stack) {
            return ${data.eatingSpeed};
        }
    </#if>

<#if data.hasGlow>
    @Environment(EnvType.CLIENT)
    @Override
    public boolean hasGlint(ItemStack stack) {
    <#if hasCondition(data.glowCondition)>
        PlayerEntity entity = MinecraftClient.getInstance().player;
        World world = entity.world;
        double x = entity.getPos().getX();
        double y = entity.getPos().getY();
        double z = entity.getPos().getZ();
        if (!(<@procedureOBJToConditionCode data.glowCondition/>)) {
            return false;
         }
    </#if>
        return true;
    }
</#if>

    public UseAction getUseAction(ItemStack stack) {
        return UseAction.${data.animation?upper_case};
    }

    <#if data.animation == "drink">
	@Override
	public net.minecraft.sound.SoundEvent getEatSound() {
	    return net.minecraft.sound.SoundEvents.ENTITY_GENERIC_DRINK;
	   }
	</#if>

    <#if data.specialInfo?has_content>
    @Override
    @Environment(EnvType.CLIENT)
    public void appendTooltip(ItemStack stack, World world, List<Text> tooltip, TooltipContext context) {
        <#list data.specialInfo as entry>
            tooltip.add(new LiteralText("${JavaConventions.escapeStringForJava(entry)}"));
        </#list>
    }
    </#if>

    <#if hasProcedure(data.onRightClicked)>
    @Override
    public TypedActionResult<ItemStack> use(World world, PlayerEntity user, Hand hand) {
        ItemStack itemstack = super.use(world, user, hand).getResult();
        int x = (int) entity.getPosX();
        int y = (int) entity.getPosY();
        int z = (int) entity.getPosZ();
            <@procedureOBJToCode data.onRightClicked/>
        return super.use(world, user, hand);
    }
    </#if>

<#if hasProcedure(data.onEntityHitWith)>
    @Override
    public boolean postHit(ItemStack stack, LivingEntity target, LivingEntity attacker) {
        super.postHit(stack, target, attacker);
        int x = (int) target.getPos().getX();
        int y = (int) target.getPos().getY();
        int z = (int) target.getPos().getZ();
        World world = target.world;
			<@procedureOBJToCode data.onEntityHitWith/>
        return true;
    }
</#if>

<#if hasProcedure(data.onItemInUseTick) || hasProcedure(data.onItemInInventoryTick)>
    @Override
    public void inventoryTick(ItemStack stack, World world, Entity entity, int slot, boolean selected) {
        super.inventoryTick(itemstack, world, entity, slot, selected);
        int x = (int) entity.getPos().getX();
        int y = (int) entity.getPos().getY();
        int z = (int) entity.getPos().getZ();
    <#if hasProcedure(data.onItemInUseTick)>
        if (selected)
    </#if>
        <@procedureOBJToCode data.onItemInInventoryTick/>
    }
</#if>

<#if hasProcedure(data.onRightClickedOnBlock)>
    @Override
    public ActionResult useOnBlock(ItemUsageContext context) {
        World world = context.getWorld();
        BlockPos pos = context.getBlockPos();
        PlayerEntity entity = context.getPlayer();
        Direction direction = context.getSide();
        int x = pos.getX();
        int y = pos.getY();
        int z = pos.getZ();
        ItemStack itemstack = context.getItem();
			<@procedureOBJToCode data.onRightClickedOnBlock/>
        return ActionResult.PASS;
    }
</#if>

    <#if hasProcedure(data.onEaten)>
        @Override
        public ItemStack finishUsing(ItemStack itemStack, World world, LivingEntity entity) {
            int x = (int) entity.getPosX();
            int y = (int) entity.getPosY();
            int z = (int) entity.getPosZ();
			<@procedureOBJToCode data.onEaten/>
            return super.onItemUseFinish(itemStack, world, entity);
        }
    </#if>

    <#if hasProcedure(data.onCrafted)>
    @Override
    public void onCraft(ItemStack stack, World world, PlayerEntity player) {
        super.onCraft(stack, world, player);
        int x = (int) player.getPosX();
        int y = (int) player.getPosY();
        int z = (int) player.getPosZ();
			<@procedureOBJToCode data.onCrafted/>
    }
    </#if>
}
<#-- @formatter:on -->
