// app/javascript/__mocks__/@editorjs/editorjs.js
const EditorJS = jest.fn().mockImplementation(() => ({
  render: jest.fn().mockResolvedValue(null),
  save: jest.fn().mockResolvedValue({ blocks: [] }),
  destroy: jest.fn(),
  isReady: Promise.resolve(),
}));

export default EditorJS;
