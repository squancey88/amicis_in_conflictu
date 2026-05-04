import React from "react";
import { render, screen } from "@testing-library/react";
import { QuestEventTextSectionForm } from ".";
import { QuestEventDataTextSection } from "../../types/events";

describe("QuestEventTextSection", () => {
  it("renders", () => {
    render(
      <QuestEventTextSectionForm
        section={{} as QuestEventDataTextSection}
        index={0}
        startOpen={true}
      />,
    );

    expect(screen.getByRole("textbox", { name: "Title" })).toBeInTheDocument();
  });
});
