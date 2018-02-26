module DatasetReader exposing (..)

import Array exposing (Array)
import Dso.GlobalCalib
import Dso.GlobalFuncs
import Dso.IOWrap.ImageRW
import Dso.ImageAndExposure exposing (ImageAndExposure)
import Dso.MinimalImage exposing (MinimalImageB, Uint8)
import Dso.Settings
import Dso.Undistort exposing (Undistort)
import External.Boost
import External.Eigen exposing (Matrix3f, Vector2i, VectorXf)
import External.Zip exposing (Zip_t)


-- MODEL #############################################################


type alias PrepImageItem =
    { id : Int
    , isQueud : Bool
    , pt : ImageAndExposure
    }


type alias ImageFolderReader =
    { undistort : Undistort

    -- private
    , preloadedImages : Array ImageAndExposure
    , files : Array String
    , timestamps : Array Float
    , exposures : Array Float
    , width : Int
    , height : Int
    , widthOrg : Int
    , heightOrg : Int
    , path : String
    , calibfile : String
    , isZipped : Bool
    , ziparchive : Zip_t
    , databuffer : Array Uint8
    }



-- FUNCTIONS #########################################################


getdir : String -> ( Array String, Int )
getdir dir =
    Debug.crash "TODO"


getOriginalCalib : ImageFolderReader -> VectorXf
getOriginalCalib model =
    Debug.crash "TODO"


getOriginalDimensions : ImageFolderReader -> Vector2i
getOriginalDimensions model =
    Debug.crash "TODO"


getCalibMono : ImageFolderReader -> ( Matrix3f, Int, Int )
getCalibMono model =
    Debug.crash "TODO"


setGlobalCalibration : ImageFolderReader -> ImageFolderReader
setGlobalCalibration model =
    Debug.crash "TODO"


getNumImages : ImageFolderReader -> Int
getNumImages model =
    Array.length model.files


getTimestamp : Int -> ImageFolderReader -> Float
getTimestamp id model =
    Debug.crash "TODO"


getImageRaw : Int -> ImageFolderReader -> MinimalImageB
getImageRaw id model =
    Debug.crash "TODO"


getImage : Int -> Bool -> ImageFolderReader -> ImageAndExposure
getImage id forceLoadDirectly model =
    Debug.crash "TODO"


getPhotometricGamma : ImageFolderReader -> Array Float
getPhotometricGamma model =
    Debug.crash "TODO"



-- private


getImageRaw_internal : Int -> Int -> ImageFolderReader -> MinimalImageB
getImageRaw_internal id unused model =
    Debug.crash "TODO"


getImage_internal : Int -> Int -> ImageFolderReader -> ImageAndExposure
getImage_internal id unused model =
    Debug.crash "TODO"


loadTimestamps : ImageFolderReader -> ImageFolderReader
loadTimestamps model =
    Debug.crash "TODO"
