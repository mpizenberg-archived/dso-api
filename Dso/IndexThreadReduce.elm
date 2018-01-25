module Dso.IndexThreadReduce exposing (..)

import Array exposing (Array)
import External.Boost as Boost


-- MODEL #############################################################


type alias IndexThreadReduce running =
    { stats : running

    -- private
    , workerThreads : Array Boost.Thread
    , isDone : Array Bool
    , gotOne : Array Bool

    -- stuff
    , exMutex : Boost.Mutex
    , todo_signal : Boost.Condition_variable
    , done_signal : Boost.Condition_variable

    -- stuff
    , nextIndex : Int
    , maxIndex : Int
    , stepSize : Int
    , running : Bool
    }



-- FUNCTIONS #########################################################


reduce : (Int -> Int -> running -> Int -> ()) -> Int -> Int -> Int -> IndexThreadReduce running -> IndexThreadReduce running
reduce callPerIndex first end stepSize model =
    Debug.crash "TODO"


callPerIndex : Int -> Int -> running -> Int -> ()
callPerIndex i j running tid =
    Debug.crash "TODO"


workerLoop : Int -> IndexThreadReduce running -> IndexThreadReduce running
workerLoop idx model =
    Debug.crash "TODO"
