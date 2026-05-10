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
    <div className="aic-pagination">
      <a onClick={() => handlePageChange(pagination.page - 1)}>
        <Icon name="caret-left-fill" />
      </a>
      <a className="page">{pagination.page}</a>
      <a onClick={() => handlePageChange(pagination.page + 1)}>
        <Icon name="caret-right-fill" />
      </a>
    </div>
  );
};

export default Pagination;
