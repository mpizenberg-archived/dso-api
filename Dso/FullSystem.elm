module Dso.FullSystem exposing (..)

import Array exposing (Array)
import Dso.CoarseInitializer exposing (CoarseInitializer)
import Dso.CoarseTracker exposing (CoarseDistanceMap, CoarseTracker)
import Dso.EnergyFunctional exposing (EnergyFunctional)
import Dso.FrameShell exposing (FrameShell)
import Dso.HessianBlocks exposing (CalibHessian, FrameHessian, PointHessian)
import Dso.ImageAndExposure exposing (ImageAndExposure)
import Dso.ImmaturePoint exposing (ImmaturePoint, ImmaturePointTemporaryResidual)
import Dso.IndexThreadReduce exposing (IndexThreadReduce)
import Dso.NumType exposing (MatXX, Vec10, Vec3, Vec4, Vec5, VecX, VecXf)
import Dso.PixelSelector2 exposing (PixelSelector)
import Dso.Residuals exposing (PointFrameResidual)
import External.Boost exposing (Condition_variable, Mutex, Thread)
import External.Std exposing (Ofstream)


-- UNKNOWN ###########################################################


type Output3DWrapper
    = Output3DWrapper



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

    -- logging stuff
    , calibLog : Ofstream
    , numsLog : Ofstream
    , errorsLog : Ofstream
    , eigenAllLog : Ofstream
    , eigenPLog : Ofstream
    , eigenALog : Ofstream
    , diagonalLog : Ofstream
    , variancesLog : Ofstream
    , nullspacesLog : Ofstream
    , coarseTrackingLog : Ofstream

    -- statistics stuff
    , statistics_lastNumOptIts : Int
    , statistics_numDroppedPoints : Int
    , statistics_numActivatedPoints : Int
    , statistics_numCreatedPoints : Int
    , statistics_numForceDroppedResBwd : Int
    , statistics_numForceDroppedResFwd : Int
    , statistics_numMargResBwd : Int
    , statistics_numMargResFwd : Int
    , statistics_lastFineTrackRMSE : Float

    -- changed by tracker-thread, protected by trackMutex
    , trackMutex : Mutex
    , allFrameHistory : Array FrameShell
    , coarseInitializer : CoarseInitializer
    , lastCoarseRMSE : Vec5

    -- changed by mapper-thread, pretected by mapMutex
    , mapMutex : Mutex
    , allKeyFramesHistory : Array FrameShell
    , ef : EnergyFunctional
    , treadReduce : IndexThreadReduce Vec10
    , selectionMap : Float
    , pixelSelector : PixelSelector
    , coarseDistanceMap : CoarseDistanceMap
    , frameHessians : Array FrameHessian
    , activeResiduals : Array PointFrameResidual
    , currentMinActDist : Float

    -- mutex for tracker exchange
    , coarseTrackerSwapMutex : Mutex
    , coarseTracker_forNewKF : CoarseTracker
    , coarseTracker : CoarseTracker
    , minIdJetVisTracker : Float
    , maxIdJetVisTracker : Float
    , minIdJetVisDebug : Float
    , maxIdJetVisDebug : Float

    -- mutex for camToWorld's in shells
    , shellPoseMutex : Mutex

    -- tracking / mapping sync, protected by trackMapSyncMutex
    , trackMapSyncMutex : Mutex
    , trackedFrameSignal : Condition_variable
    , mappedFrameSignal : Condition_variable
    , unmappedTrackedFrames : List FrameHessian
    , needNewKFAfter : Int
    , mappingThread : Thread
    , runMapping : Bool
    , needToKetchupMapping : Bool
    , lastRefStopId : Int
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


linearizeAll_Reductor : Bool -> Array PointFrameResidual -> Int -> Int -> Vec10 -> Int -> FullSystem -> ( FullSystem, Array PointFrameResidual, Vec10 )
linearizeAll_Reductor fixLinearization toRemove min max stats tid model =
    Debug.crash "TODO"


{-| Rmq: stats and tid are not used.
-}
activatePointsMT_Reductor : Array PointHessian -> Array ImmaturePoint -> Int -> Int -> Vec10 -> Int -> FullSystem -> ( FullSystem, Array PointHessian )
activatePointsMT_Reductor optimized toOptimize min max stats tid model =
    Debug.crash "TODO"


{-| Rmq: copyJacobians, stats and tid are not used.
-}
applyRes_Reductor : Bool -> Int -> Int -> Vec10 -> Int -> FullSystem -> FullSystem
applyRes_Reductor copyJacobians min max stats tid =
    Debug.crash "TODO"


printOptRes : Vec3 -> Float -> Float -> Float -> Float -> Float -> Float -> FullSystem -> FullSystem
printOptRes res resL resM resPrior lExact a b model =
    Debug.crash "TODO"


debugPlotTracking : FullSystem -> FullSystem
debugPlotTracking model =
    Debug.crash "TODO"


getNullspaces : FullSystem -> ( FullSystem, VecX, VecX, VecX, VecX, VecX )
getNullspaces model =
    Debug.crash "TODO"


setNewFrameEnergyTH : FullSystem -> FullSystem
setNewFrameEnergyTH model =
    Debug.crash "TODO"


printLogLine : FullSystem -> FullSystem
printLogLine model =
    Debug.crash "TODO"


printEvalLine : FullSystem -> FullSystem
printEvalLine model =
    Debug.crash "TODO"


printEigenValLine : FullSystem -> FullSystem
printEigenValLine model =
    Debug.crash "TODO"



-- Tracking always uses the newest KF as reference


makeKeyFrame : FrameHessian -> FullSystem -> ( FullSystem, FrameHessian )
makeKeyFrame fh model =
    Debug.crash "TODO"


makeNonKeyFrame : FrameHessian -> FullSystem -> ( FullSystem, FrameHessian )
makeNonKeyFrame fh model =
    Debug.crash "TODO"


deliverTrackedFrame : FrameHessian -> Bool -> FullSystem -> ( FullSystem, FrameHessian )
deliverTrackedFrame fh model =
    Debug.crash "TODO"


mappingLoop : FullSystem -> FullSystem
mappingLoop model =
    Debug.crash "TODO"
