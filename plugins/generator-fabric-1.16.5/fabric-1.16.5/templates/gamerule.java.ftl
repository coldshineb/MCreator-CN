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

package ${package}.world;

public class ${name}GameRule {

	<#if data.type == "Number">
	public static final GameRules.Key<GameRules.IntRule> gamerule = GameRuleRegistry.register("${registryname}", GameRules.Category.${data.category}, GameRuleFactory.createIntRule(${data.defaultValueNumber}));
	<#else>
	public static final GameRules.Key<GameRules.BooleanRule> gamerule = GameRuleRegistry.register("${registryname}", GameRules.Category.${data.category}, GameRuleFactory.createBooleanRule(${data.defaultValueLogic}));
	</#if>
}
<#-- @formatter:on -->