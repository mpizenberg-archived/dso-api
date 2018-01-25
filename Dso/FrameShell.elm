module Dso.FrameShell exposing (..)

import Dso.NumType exposing (AffLight, SE3)


type FrameShellPointer
    = FrameShellPointer


type alias FrameShell =
    -- internal id, starting at 0
    { id : Int

    -- ID passed into DSO
    , incoming_id : Int

    -- timestamp passed into DSO
    , timestamp : Float

    -- set once after tracking
    , camToTrackingRef : SE3
    , trackingRef : FrameShellPointer

    -- constantly adapted
    , camToWorld : SE3
    , aff_g2l : AffLight
    , poseValid : Bool

    -- statistics
    , statistics_outlierResOnThis : Int
    , statistics_goodResOnThis : Int
    , marginalizedAt : Int
    , movedByOpt : Float
    }
