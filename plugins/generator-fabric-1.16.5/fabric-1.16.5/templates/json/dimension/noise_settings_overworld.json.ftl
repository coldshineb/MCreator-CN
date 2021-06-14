<#-- @formatter:off -->
<#include "../../mcitems.ftl">
{
  "aquifers_enabled": ${data.imitateOverworldBehaviour},
  "noise_caves_enabled": ${data.imitateOverworldBehaviour},
  "deepslate_enabled": ${data.imitateOverworldBehaviour},
  "bedrock_roof_position": -10,
  "bedrock_floor_position": 0,
  "sea_level": 63,
  "disable_mob_generation": ${!data.imitateOverworldBehaviour},
  "default_block": ${mappedMCItemToBlockStateJSON(data.mainFillerBlock)},
  "default_fluid": ${mappedMCItemToBlockStateJSON(data.fluidBlock)},
  "noise": {
  <#if data.imitateOverworldBehaviour>
    "min_y": -64,
    "height": 384,
  <#else>
    "min_y": 0,
    "height": 256,
  </#if>
    "density_factor": 1,
    "density_offset": -0.46875,
    "size_horizontal": 1,
    "size_vertical": 2,
    "simplex_surface_noise": true,
    "random_density_offset": true,
    "island_noise_override": false,
    "amplified": false,
    "sampling": {
      "xz_scale": 1,
      "y_scale": 1,
      "xz_factor": 80,
      "y_factor": 160
    },
    "bottom_slide": {
      "target": -30,
      "size": 0,
      "offset": 0
    },
    "top_slide": {
      "target": -10,
      "size": 3,
      "offset": 0
    }
  },
  "structures": {
    "structures": {}
  }
}
<#-- @formatter:o`n -->