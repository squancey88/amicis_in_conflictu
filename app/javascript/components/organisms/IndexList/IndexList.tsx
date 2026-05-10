import React from "react";
import {
  IndexItem,
  type IndexRecord,
  type DisplayConfigItem,
} from "Molecules/IndexItem";
import { Pagination } from "Atoms/Pagination";
import useIndex from "Hooks/useIndex";

interface IndexListProps<T extends IndexRecord> {
  title?: string;
  indexPath: string;
  newPath?: string;
  displayConfig: Array<DisplayConfigItem<T>>;
}

const IndexList = <T extends IndexRecord>({
  indexPath,
  title,
  newPath,
  displayConfig,
}: IndexListProps<T>) => {
  const { records, pagination, loading, error, loadPage } = useIndex(indexPath);

  return (
    <div className="aic-index-list">
      <div className="aic-title-with-buttons">
        <div className="content">{title}</div>
        <div className="buttons">{newPath && <a href={newPath}>New</a>}</div>
      </div>
      <div className="records">
        {loading && <p>Loading...</p>}
        {records.map((record: IndexRecord) => (
          <IndexItem
            key={record.id}
            record={record as T}
            displayConfig={displayConfig}
          />
        ))}
      </div>
      {pagination && <Pagination pagination={pagination} onChange={loadPage} />}
    </div>
  );
};

export default IndexList;
