<#include "mcitems.ftl">
if(!world.isClient()) {
	ItemEntity entityToSpawn=new ItemEntity(world, ${input$x}, ${input$y}, ${input$z}, new ItemStack(${mappedMCItemToItemStackCode(input$block, 1)}, 1));
	entityToSpawn.setPickupDelay(10);
	world.spawnEntity(entityToSpawn);
}
