<#if data.breedable>
<#include "aiconditions.java.ftl">
this.goalSelector.add(${customBlockIndex+1}, new FollowParentGoal(this, ${field$speed})<@conditionCode field$condition/>);
</#if>