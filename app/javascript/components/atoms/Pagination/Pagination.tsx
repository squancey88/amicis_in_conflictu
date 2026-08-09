import { Icon } from "Atoms/Icon";
import classNames from "classnames";
import { APIResponse } from "Hooks/useIndex";
import { useState } from "react";

export interface PaginationValues {
  count: number;
  limit: number;
  page: number;
  last: number;
}

interface PaginationProps {
  pagination: PaginationValues;
  onChange: (page: number) => Promise<APIResponse>;
}

const Pagination = ({ pagination, onChange }: PaginationProps) => {
  const [currentPage, setCurrentPage] = useState(1);
  const handlePageChange = (targetPage: number) => {
    if (targetPage < 1) return;
    if (targetPage > pagination.last) return;

    setCurrentPage(targetPage);
    void onChange(targetPage);
  };

  const pageList = Array.from({ length: pagination.last }, (_, pageIndex: number) => {
    const page = pageIndex + 1;
    return (
      <button
        className={classNames("page", currentPage === page ? "active" : "")}
        key={page}
        onClick={() => handlePageChange(page)}
      >
        {page}
      </button>
    );
  });

  return (
    <nav className="aic-pagination" role="navigation">
      <button onClick={() => handlePageChange(pagination.page - 1)}>
        <Icon name="caret-left-fill" />
      </button>
      {pageList}
      <button onClick={() => handlePageChange(pagination.page + 1)}>
        <Icon name="caret-right-fill" />
      </button>
    </nav>
  );
};

export default Pagination;
