if(${input$entity} instanceof EntityPlayerMP) {
	Advancement _adv = ((MinecraftServer)((EntityPlayerMP)${input$entity}).mcServer).getAdvancementManager()
        .getAdvancement(new ResourceLocation("${generator.map(field$achievement, "achievements")}"));
    AdvancementProgress _ap = ((EntityPlayerMP) ${input$entity}).getAdvancements().getProgress(_adv);
    if (!_ap.isDone()) {
        Iterator _iterator = _ap.getRemaningCriteria().iterator();
        while(_iterator.hasNext()) {
            String _criterion = (String)_iterator.next();
            ((EntityPlayerMP) ${input$entity}).getAdvancements().grantCriterion(_adv, _criterion);
        }
    }
}
