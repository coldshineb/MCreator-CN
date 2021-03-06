<#-- @formatter:off -->
<#include "mcitems.ftl">
{
    "group": "<#if data.group?has_content>${data.group}<#else>${modid}</#if>",
    "type": "minecraft:blasting",
    "experience": ${data.xpReward},
	"cookingtime": ${data.cookingTime},
    "ingredient": {
      ${mappedMCItemToIngameItemName(data.blastingInputStack)}
    },
    "result": {
      ${mappedMCItemToIngameItemName(data.blastingReturnStack)}
    }
}
<#-- @formatter:on -->