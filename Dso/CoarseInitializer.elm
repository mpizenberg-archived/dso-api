module Dso.CoarseInitializer exposing (CoarseInitializer)

import Array exposing (Array)
import Dso.HessianBlocks exposing (CalibHessian, FrameHessian)
import Dso.NumType exposing (AffLight, Mat33f, Mat88, SE3, Vec10f, Vec2f, Vec3f, Vec8, Vec8f)
import External.Eigen exposing (DiagonalMatrix8, Vector3f)


-- UNKNOWN ###########################################################


type Output3DWrapper
    = Output3DWrapper


type Accumulator9
    = Accumulator9


type BBOX
    = BBOX



-- MODEL #############################################################


type alias Pnt =
    -- index in jacobian
    { u : Float
    , v : Float

    -- idepth / isgood / energy during optimization
    , idepth : Float
    , isGood : Bool

    -- (UenergyPhotometric, energyRegularizer)
    , energy : Vec2f
    , isGood_new : Bool
    , idepth_new : Float
    , energy_new : Vec2f
    , iR : Float
    , iRSumNum : Float
    , lastHessian : Float
    , lastHessian_new : Float

    -- max stepsize for idepth (corresponding to max. movement in pixel-space)
    , maxstep : Float

    -- idx (x+y*w) of closest point one pyramid level above
    , parent : Int
    , parentDist : Float

    -- idx (x+y*w) of up to 10 nearest points in pixel space
    , neighbours : Array Int
    , neighboursDict : Array Float

    -- stuff
    , my_type : Float
    , outlierTH : Float
    }


type alias CoarseInitializer =
    { frameID : Int
    , fixAffine : Bool
    , printDebug : Bool
    , points : Array Pnt
    , numPoints : Array Int
    , thisToNext_aff : AffLight
    , thisToNext : SE3

    -- stuff
    , firstFrame : FrameHessian
    , newFrame : FrameHessian

    -- private stuff
    -- pyramid levels
    , k : Array Mat33f
    , ki : Array Mat33f
    , fx : Array Float
    , fy : Array Float
    , fxi : Array Float
    , fyi : Array Float
    , cx : Array Float
    , cy : Array Float
    , cxi : Array Float
    , cyi : Array Float
    , w : Array Int
    , h : Array Int

    -- stuff
    , snapped : Bool
    , snappedAt : Int

    -- Lol, two attributes not used
    , dINew : Array Vector3f
    , dIFist : Array Vector3f

    -- stuff
    , wM : DiagonalMatrix8

    -- temporary buffers for H and b
    -- 0-7: sum(dd*dp), 8: sum(res*dd), 9: 1/(1+sum(dd*dd)) = inverse hessian entry
    , jBBuffer : Vec10f
    , jBBuffer_new : Vec10f

    --stuff
    , acc9 : Accumulator9
    , acc9SC : Accumulator9
    , dGrads : Array Vec3f
    , alphaK : Float
    , alphaW : Float
    , regWeight : Float
    , couplingWeight : Float
    }


type alias FLANNPointcloud =
    { num : Int
    , points : Array Pnt
    }



-- FUNCTIONS #########################################################


initCoarseInitializer : Int -> Int -> CoarseInitializer
initCoarseInitializer w h =
    Debug.crash "TODO"


setFirst : CalibHessian -> FrameHessian -> CoarseInitializer -> ( CoarseInitializer, CalibHessian, FrameHessian )
setFirst hCalib newFrameHessian model =
    Debug.crash "TODO"


trackFrame : FrameHessian -> Array Output3DWrapper -> CoarseInitializer -> ( CoarseInitializer, FrameHessian, Bool )
trackFrame newFrameHessian wraps model =
    Debug.crash "TODO"


calcTGrads : FrameHessian -> CoarseInitializer -> ( CoarseInitializer, FrameHessian )
calcTGrads newFrameHessian model =
    Debug.crash "TODO"


makeK : CalibHessian -> CoarseInitializer -> ( CoarseInitializer, CalibHessian )
makeK hCalib model =
    Debug.crash "TODO"


calcResAndGS : Int -> Mat88 -> Vec8 -> SE3 -> AffLight -> Float -> CoarseInitializer -> ( CoarseInitializer, Vec3f )
calcResAndGS lvl h_out b_out refToNew aff_g2l cutoffTH model =
    Debug.crash "TODO"


calcEC : Int -> CoarseInitializer -> ( CoarseInitializer, Vec3f )
calcEC lvl model =
    Debug.crash "TODO"


optReg : Int -> CoarseInitializer -> CoarseInitializer
optReg lvl model =
    Debug.crash "TODO"


propagateUp : Int -> CoarseInitializer -> CoarseInitializer
propagateUp srcLvl model =
    Debug.crash "TODO"


propagateDown : Int -> CoarseInitializer -> CoarseInitializer
propagateDown srcLvl model =
    Debug.crash "TODO"


rescale : CoarseInitializer -> ( CoarseInitializer, Float )
rescale model =
    Debug.crash "TODO"


resetPoints : Int -> CoarseInitializer -> CoarseInitializer
resetPoints lvl model =
    Debug.crash "TODO"


doStep : Int -> Float -> Vec8f -> CoarseInitializer -> CoarseInitializer
doStep lvl lambda inc model =
    Debug.crash "TODO"


applyStep : Int -> CoarseInitializer -> CoarseInitializer
applyStep lvl model =
    Debug.crash "TODO"


makeGradients : Array (Array Vector3f) -> CoarseInitializer -> Array (Array Vector3f)
makeGradients data model =
    Debug.crash "TODO"


debugPlot : Int -> Array Output3DWrapper -> CoarseInitializer -> CoarseInitializer
debugPlot lvl wraps model =
    Debug.crash "TODO"


makeNN : CoarseInitializer -> CoarseInitializer
makeNN model =
    Debug.crash "TODO"



-- FLANNPointcloud methods


kdtree_get_point_count : FLANNPointcloud -> Int
kdtree_get_point_count model =
    model.num


kdtree_distance : ( Float, Float ) -> Int -> FLANNPointcloud -> Float
kdtree_distance p1 idx_p2 model =
    Debug.crash "TODO"


kdtree_get_pt : Int -> Int -> FLANNPointcloud -> Float
kdtree_get_pt idx dim model =
    Debug.crash "TODO"


{-| HAHA lol, function returns just False. Not used btw.
-}
kdtree_get_bbox : BBOX -> FLANNPointcloud -> Bool
kdtree_get_bbox bbox model =
    False
