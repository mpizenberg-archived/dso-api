module Dso.FullSystem
    exposing
        ( FullSystem
        )

{-| module ...

@docs FullSystem

-}

import Array exposing (Array)
import Dso.HessianBlocks exposing (CalibHessian, FrameHessian, PointHessian)
import Dso.ImmaturePoint exposing (ImmaturePoint, ImmaturePointTemporaryResidual)
import Dso.NumType exposing (MatXX, Vec10, Vec3, Vec4, VecXf)
import Dso.Residuals exposing (PointFrameResidual)


-- UNKNOWN ###########################################################


type Output3DWrapper
    = Output3DWrapper


type ImageAndExposure
    = ImageAndExposure



-- MODEL #############################################################


{-| whatever
-}
type alias FullSystem =
    { outputWrapper : Array Output3DWrapper

    -- system status
    , isLost : Bool
    , initFailed : Bool
    , initialized : Bool
    , linearizeOperation : Bool

    -- all following attributes are private
    , hCalib : CalibHessian
    }



-- FUNCTIONS #########################################################


deleteOut : Int -> Array a -> Array a
deleteOut index vector =
    Debug.crash "TODO"


deleteOutPt : a -> Array a -> Array a
deleteOutPt element vector =
    Debug.crash "TODO"


deleteOutOrder : Int -> Array a -> Array a
deleteOutOrder index vector =
    Debug.crash "TODO"


deleteOutOrderPt : a -> Array a -> Array a
deleteOutOrderPt element vector =
    Debug.crash "TODO"


eigenTestNan : String -> MatXX -> Bool
eigenTestNan msg matrix =
    Debug.crash "TODO"



-- FullSystem methods


{-| adds a new frame, and creates point and residual structs
-}
addActiveFrame : Int -> ImageAndExposure -> FullSystem -> FullSystem
addActiveFrame id image model =
    Debug.crash "TODO"


{-| marginalizes a frame, drops / marginalizes points and residuals
-}
marginalizeFrame : FrameHessian -> FullSystem -> FullSystem
marginalizeFrame frame model =
    Debug.crash "TODO"


blockUntilMappingIsFinished : FullSystem -> FullSystem
blockUntilMappingIsFinished model =
    Debug.crash "TODO"


optimize : Int -> FullSystem -> FullSystem
optimize mnumOptIts model =
    Debug.crash "TODO"


printResult : String -> FullSystem -> FullSystem
printResult file model =
    Debug.crash "TODO"


debugPlot : String -> FullSystem -> FullSystem
debugPlot name model =
    Debug.crash "TODO"


printFrameLifetimes : FullSystem -> FullSystem
printFrameLifetimes model =
    Debug.crash "TODO"


setGammaFunction : Float -> FullSystem -> FullSystem
setGammaFunction binv model =
    Debug.crash "TODO"


setOriginalCalib : VecXf -> Int -> Int -> FullSystem -> FullSystem
setOriginalCalib originalCalib originalW originalH model =
    Debug.crash "TODO"



-- private FullSystem methods


optimizePoint : PointHessian -> Int -> Bool -> FullSystem -> ( FullSystem, Int )
optimizePoint point minObs flagOOB model =
    Debug.crash "TODO"


optimizeImmaturePoint : ImmaturePoint -> Int -> FullSystem -> ( FullSystem, PointHessian, ImmaturePointTemporaryResidual )
optimizeImmaturePoint point minObs model =
    Debug.crash "TODO"


linAllPointSinle : PointHessian -> Float -> Bool -> FullSystem -> ( FullSystem, Float )
linAllPointSinle point outlierThSlack plot model =
    Debug.crash "TODO"



-- main pipeline functions


trackNewCoarse : FrameHessian -> FullSystem -> ( FullSystem, Vec4 )
trackNewCoarse fh model =
    Debug.crash "TODO"


traceNewCoarse : FrameHessian -> FullSystem -> FullSystem
traceNewCoarse fh model =
    Debug.crash "TODO"


activatePoints : FullSystem -> FullSystem
activatePoints model =
    Debug.crash "TODO"


activatePointsMT : FullSystem -> FullSystem
activatePointsMT model =
    Debug.crash "TODO"


activatePointsOldFirst : FullSystem -> FullSystem
activatePointsOldFirst model =
    Debug.crash "TODO"


flagPointsForRemoval : FullSystem -> FullSystem
flagPointsForRemoval model =
    Debug.crash "TODO"


{-| Rmq: gtDepth is not used in implementation ...
-}
makeNewTraces : FrameHessian -> Float -> FullSystem -> FullSystem
makeNewTraces newFrame gtDepth model =
    Debug.crash "TODO"


initializeFromInitializer : FrameHessian -> FullSystem -> ( FullSystem, FrameHessian )
initializeFromInitializer newFrame model =
    Debug.crash "TODO"


{-| Rmq: newFH is not used in implementation ...
-}
flagFramesForMarginalization : FrameHessian -> FullSystem -> FullSystem
flagFramesForMarginalization newFH model =
    Debug.crash "TODO"


removeOutliers : FullSystem -> FullSystem
removeOutliers model =
    Debug.crash "TODO"


setPrecalcValues : FullSystem -> FullSystem
setPrecalcValues model =
    Debug.crash "TODO"



-- solving system stuff


solveSystem : Int -> Float -> FullSystem -> FullSystem
solveSystem iteration lambda model =
    Debug.crash "TODO"


linearizeAll : Bool -> FullSystem -> ( FullSystem, Vec3 )
linearizeAll fixLinearization model =
    Debug.crash "TODO"


doStepFromBackup : Float -> Float -> Float -> Float -> Float -> FullSystem -> ( FullSystem, Bool )
doStepFromBackup stepfacC stepfacT stepfacR stepfacA stepfacD model =
    Debug.crash "TODO"


backupState : Bool -> FullSystem -> FullSystem
backupState backupLastStep model =
    Debug.crash "TODO"


loadStateBackup : FullSystem -> FullSystem
loadStateBackup model =
    Debug.crash "TODO"


calcLEnergy : FullSystem -> Float
calcLEnergy model =
    Debug.crash "TODO"


calcLMnergy : FullSystem -> Float
calcLMnergy model =
    Debug.crash "TODO"


linearizeAll_Reductor : Bool -> Array PointFrameResidual -> Int -> Int -> Vec10 -> Int -> FullSystem -> FullSystem
linearizeAll_Reductor fixLinearization toRemove min max stats tid model =
    Debug.crash "TODO"
