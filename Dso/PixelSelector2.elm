module Dso.PixelSelector2 exposing (PixelSelector)

{-| module ...

@docs PixelSelector

-}

import Array exposing (Array)
import Dso.HessianBlocks exposing (FrameHessian)
import External.Eigen as Eigen


-- MODEL #############################################################


{-| whatever
-}
type alias PixelSelector =
    { currentPotential : Int
    , allowFast : Bool

    -- private
    , randomPattern : Array Int
    , gradHist : Array Int
    , ths : Array Float
    , thsSmoothed : Array Float
    , thsStep : Int
    , gradHistFrame : FrameHessian
    }


type PixelSelectorStatus
    = Pixsel_void
    | Pixsel_1
    | Pixsel_2
    | Pixsel_3



-- FUNCTIONS #########################################################


init : Int -> Int -> PixelSelector
init w h =
    Debug.crash "TODO"


makeMaps :
    FrameHessian
    -> Float
    -> Int
    -> Bool
    -> Float
    -> PixelSelector
    -> ( PixelSelector, Array Float, Int )
makeMaps fh density recursionsLeft plot thFactor model =
    Debug.crash "TODO"


makeHists : FrameHessian -> PixelSelector -> PixelSelector
makeHists fh model =
    Debug.crash "TODO"


select : FrameHessian -> Int -> Float -> PixelSelector -> ( PixelSelector, Eigen.Vector3i, Array Float )
select fh pot thFactor model =
    Debug.crash "TODO"
