if(world.isClient()) {
        world.addParticle(ParticleTypes.${generator.map(field$particle, "particles")}, ${input$x}, ${input$y}, ${input$z}, ${input$xs}, ${input$ys}, ${input$zs});
}
