----------------------------------------------------------------------------------------------------
-- ManureSystemEventBits
----------------------------------------------------------------------------------------------------
-- Purpose: Struct with defined event bits to lower coupling.
--
-- Copyright (c) Wopster, 2019
----------------------------------------------------------------------------------------------------

---@class ManureSystemEventBits
ManureSystemEventBits = {}

---Max number of bits for the Hose.
ManureSystemEventBits.GRAB_NODES_SEND_NUM_BITS = 2 -- 2 ^ 2

---Max number of bits for the ManureSystemConnectors.
ManureSystemEventBits.CONNECTORS_SEND_NUM_BITS = 4 -- 2 ^ 4
