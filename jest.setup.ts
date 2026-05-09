import "@testing-library/jest-dom";
import React from "react";

jest.mock("@dnd-kit/react", () => ({
  DragDropProvider: ({ children }: { children: any }) => children,
}));

jest.mock("@dnd-kit/react/sortable", () => ({
  useSortable: () => ({
    ref: { current: null },
    isDragging: false,
    isDropTarget: false,
  }),
}));

jest.mock("@dnd-kit/helpers", () => ({
  move: (items: unknown[]) => items,
}));
