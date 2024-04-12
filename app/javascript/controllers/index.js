import { application } from "./application";

import EditorController from './editorjs_controller';
import NewGameModalController from '../../components/new_game_modal_component/new_game_modal_controller';
import GameFormController from '../../components/game_form_component/game_form_controller';

application.register('editorjs', EditorController);
application.register('new-game-modal', NewGameModalController);
application.register('game-form', GameFormController);