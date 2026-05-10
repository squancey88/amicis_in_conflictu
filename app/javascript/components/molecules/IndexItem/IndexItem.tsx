import React from "react";
import { AICRecord } from "../../types/common";

export interface DisplayConfigItem<T> {
  attribute: keyof T;
}

export interface IndexRecord extends AICRecord {
  show_path: string;
  edit_path: string;
}

interface IndexItemProps<T extends IndexRecord> {
  record: T;
  displayConfig: Array<DisplayConfigItem<T>>;
}

const IndexItem = <T extends IndexRecord>({
  record,
  displayConfig,
}: IndexItemProps<T>) => {
  const attributes = displayConfig.map((config: DisplayConfigItem<T>) => {
    const value = record[config.attribute];
    return <div key={String(value)}>{String(value)}</div>;
  });

  return (
    <div className="index-item" id={record.id}>
      <div className="attributes">{attributes}</div>
      <div className="menu">
        <a className="btn btn-primary" href={record.show_path}>
          View
        </a>
        <a className="btn btn-primary" href={record.edit_path}>
          Edit
        </a>
      </div>
    </div>
  );
};

export default IndexItem;
