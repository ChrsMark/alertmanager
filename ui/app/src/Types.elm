module Types exposing (Model, Msg(..), Route(..))

import Alerts.Types exposing (AlertGroup, Alert)
import Views.AlertList.Types as AlertList exposing (AlertListMsg)
import Views.SilenceList.Types as SilenceList exposing (SilenceListMsg)
import Views.SilenceView.Types as SilenceView exposing (SilenceViewMsg)
import Views.SilenceForm.Types as SilenceForm exposing (SilenceFormMsg)
import Views.Status.Types exposing (StatusModel, StatusMsg)
import Utils.Filter exposing (Filter)
import Utils.Types exposing (ApiData)


type alias Model =
    { silenceList : SilenceList.Model
    , silenceView : SilenceView.Model
    , silenceForm : SilenceForm.Model
    , alertList : AlertList.Model
    , route : Route
    , filter : Filter
    , status : StatusModel
    , basePath : String
    , apiUrl : String
    , bootstrapCSS : ApiData String
    }


type Msg
    = CreateSilenceFromAlert Alert
    | MsgForAlertList AlertListMsg
    | MsgForSilenceView SilenceViewMsg
    | MsgForSilenceForm SilenceFormMsg
    | MsgForSilenceList SilenceListMsg
    | MsgForStatus StatusMsg
    | NavigateToAlerts Filter
    | NavigateToNotFound
    | NavigateToSilenceView String
    | NavigateToSilenceFormEdit String
    | NavigateToSilenceFormNew Bool
    | NavigateToSilenceList Filter
    | NavigateToStatus
    | Noop
    | RedirectAlerts
    | UpdateFilter String
    | BootstrapCSSLoaded (ApiData String)


type Route
    = AlertsRoute Filter
    | NotFoundRoute
    | SilenceFormEditRoute String
    | SilenceFormNewRoute Bool
    | SilenceListRoute Filter
    | SilenceViewRoute String
    | StatusRoute
    | TopLevelRoute