import { application } from "./application";

import ArmySelectorController from '../../components/player_forms/wargames/army_selector_component/army_selector_controller';
import CampaignAndArmySelectorController from '../../components/game_systems/campaign_and_army_selector_component/campaign_and_army_selector_controller';
import EditorController from './editorjs_controller';
import FormsArrayFieldController from "../../components/forms/array_field_component/array_field_controller";
import GameControlController from '../../components/game_control_component/game_control_controller';
import GameFormController from '../../components/game_form_component/game_form_controller';
import JsonEditorController from './json_editor_controller';
import NewGameModalController from '../../components/new_game_modal_component/new_game_modal_controller';
import QuestEventsDetailsFormController from '../../components/quests/events/details_form_component/details_form_controller';
import QuestEventsSelectorController from '../../components/quests/events/selector_component/selector_component_controller'
import TurnBasedGameFormController from '../../components/game_forms/turn_based_component/turn_based_controller';

application.register('army-selector', ArmySelectorController);
application.register('campaign-and-army-selector', CampaignAndArmySelectorController);
application.register('editorjs', EditorController);
application.register('forms-array-controller', FormsArrayFieldController);
application.register('game-control', GameControlController);
application.register('game-form', GameFormController);
application.register('game-forms-turn-based', TurnBasedGameFormController);
application.register('json-editor', JsonEditorController);
application.register('new-game-modal', NewGameModalController);
application.register('quest-event-details-form', QuestEventsDetailsFormController);
application.register('quests-events-selector', QuestEventsSelectorController);
