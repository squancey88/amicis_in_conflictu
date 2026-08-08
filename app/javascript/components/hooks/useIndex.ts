import { useState, useEffect, useCallback } from "react";
import { IndexRecord } from "Molecules/IndexItem";
import { PaginationValues } from "Atoms/Pagination";

export interface APIResponse {
  records: Array<IndexRecord>;
  pagination: PaginationValues;
}

export default function useIndex(indexPath: string) {
  const [records, setRecords] = useState<Array<IndexRecord>>([]);
  const [pagination, setPagination] = useState<PaginationValues | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const getRecords = useCallback(
    async (page = 1) => {
      setLoading(true);
      setError(null);
      try {
        const url = new URL(indexPath, globalThis.location.origin);
        url.searchParams.set("page", String(page));
        const response = await fetch(url);
        if (!response.ok) throw new Error("Failed to fetch records");
        const data: APIResponse = (await response.json()) as APIResponse;
        setRecords(data.records);
        setPagination(data.pagination);
      } catch (e) {
        setError(e instanceof Error ? e.message : "Something went wrong");
      } finally {
        setLoading(false);
      }
    },
    [indexPath],
  );

  useEffect(() => {
    void getRecords();
  }, [getRecords]);

  return { records, pagination, loading, error, loadPage: getRecords };
}
