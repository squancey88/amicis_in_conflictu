import { application } from "./application";

import EditorController from './editorjs_controller';
import NewGameModalController from '../../components/new_game_modal_component/new_game_modal_controller';
import TurnBasedGameFormController from '../../components/turn_based_game_form_component/turn_based_game_form_controller';

application.register('editorjs', EditorController);
application.register('new-game-modal', NewGameModalController);
application.register('turn-based-game-form', TurnBasedGameFormController);