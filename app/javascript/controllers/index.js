import { application } from "./application";

import EditorController from './editorjs_controller';
import JsonEditorController from './json_editor_controller';
import NewGameModalController from '../../components/new_game_modal_component/new_game_modal_controller';
import TurnBasedGameFormController from '../../components/game_forms/turn_based_component/turn_based_controller';
import ArmySelectorController from '../../components/player_forms/wargames/army_selector_component/army_selector_controller';
import GameFormController from '../../components/game_form_component/game_form_controller';
import CampaignAndArmySelectorController from '../../components/game_systems/campaign_and_army_selector_component/campaign_and_army_selector_controller';
import QuestEventsDetailsFormContrller from '../../components/quests/events/details_form_component/details_form_controller';

application.register('editorjs', EditorController);
application.register('json-editor', JsonEditorController);
application.register('new-game-modal', NewGameModalController);
application.register('game-forms-turn-based', TurnBasedGameFormController);
application.register('army-selector', ArmySelectorController);
application.register('game-form', GameFormController);
application.register('campaign-and-army-selector', CampaignAndArmySelectorController);
application.register('quest-event-details-form', QuestEventsDetailsFormContrller);