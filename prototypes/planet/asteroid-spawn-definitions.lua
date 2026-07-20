-- extends space-age's asteroid_util table in place, so any file that requires
-- either this module or the space-age one directly sees the additions below
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

asteroid_util.shipyard_chunks = 0.1

asteroid_util.nauvis_senestellagate =
{
  probability_on_range_chunk =
  {
    {position = 0.1, probability = asteroid_util.nauvis_chunks, angle_when_stopped = asteroid_util.chunk_angle},
    {position = 0.9, probability = asteroid_util.nauvis_chunks, angle_when_stopped = asteroid_util.chunk_angle}
  },
  type_ratios =
  {
    {position = 0.1, ratios = asteroid_util.nauvis_ratio},
    {position = 0.9, ratios = asteroid_util.nauvis_ratio},
  }
}

asteroid_util.fulgora_senestellagate =
{
  probability_on_range_chunk =
  {
    {position = 0.1, probability = asteroid_util.fulgora_chunks, angle_when_stopped = asteroid_util.chunk_angle},
    {position = 0.9, probability = asteroid_util.nauvis_chunks, angle_when_stopped = asteroid_util.chunk_angle}
  },
  type_ratios =
  {
    {position = 0.1, ratios = asteroid_util.fulgora_ratio},
    {position = 0.9, ratios = asteroid_util.nauvis_ratio},
  }
}

asteroid_util.calidusgate_shipyard =
{
  probability_on_range_chunk =
  {
    {position = 0.1, probability = asteroid_util.nauvis_chunks, angle_when_stopped = asteroid_util.chunk_angle},
    {position = 0.9, probability = asteroid_util.shipyard_chunks, angle_when_stopped = asteroid_util.chunk_angle}
  },
  type_ratios =
  {
    {position = 0.1, ratios = {1, 1, 1, 0}},
    {position = 0.9, ratios = {1, 1, 1, 0}},
  }
}

return asteroid_util
