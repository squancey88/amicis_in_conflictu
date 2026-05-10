import React, { useEffect, useState } from "react";
import {
  IndexItem,
  type IndexRecord,
  type DisplayConfigItem,
} from "Molecules/IndexItem";
import { Pagination, type PaginationValues } from "Atoms/Pagination";
import { useIndex } from "../../hooks/useIndex";

interface IndexListProps {
  title?: string;
  indexPath: string;
  newPath?: string;
  displayConfig: Array<DisplayConfigItem<IndexRecord>>;
}

const IndexList = ({
  indexPath,
  title,
  newPath,
  displayConfig,
}: IndexListProps) => {
  const { records, pagination, loading, error, loadPage } = useIndex(indexPath);

  return (
    <div className="aic-index-list">
      <div className="aic-title-with-buttons">
        <div className="content">{title}</div>
        <div className="buttons">{newPath && <a href={newPath}>New</a>}</div>
      </div>
      <div className="records">
        {records.map((record: IndexRecord) => (
          <IndexItem
            key={record.id}
            record={record}
            displayConfig={displayConfig}
          />
        ))}
      </div>
      {pagination && <Pagination pagination={pagination} onChange={loadPage} />}
    </div>
  );
};

export default IndexList;
