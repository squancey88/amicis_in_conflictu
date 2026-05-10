import React from "react";
import { Icon } from "Atoms/Icon";

export interface PaginationValues {
  count: number;
  limit: number;
  page: number;
  last: number;
}

interface PaginationProps {
  pagination: PaginationValues;
  onChange: (page: number) => void;
}

const Pagination = ({ pagination, onChange }: PaginationProps) => {
  const handlePageChange = (targetPage: number) => {
    if (targetPage < 1) return;
    if (targetPage > pagination.last) return;

    onChange(targetPage);
  };

  return (
    <nav className="aic-pagination" role="navigation">
      <button onClick={() => handlePageChange(pagination.page - 1)}>
        <Icon name="caret-left-fill" />
      </button>
      <button className="page">{pagination.page}</button>
      <button onClick={() => handlePageChange(pagination.page + 1)}>
        <Icon name="caret-right-fill" />
      </button>
    </nav>
  );
};

export default Pagination;
