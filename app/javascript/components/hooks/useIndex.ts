import { useState, useEffect } from "react";
import { IndexRecord } from "Molecules/IndexItem";
import { PaginationValues } from "Atoms/Pagination";

export default function useIndex(indexPath: string) {
  const [records, setRecords] = useState<Array<IndexRecord>>([]);
  const [pagination, setPagination] = useState<PaginationValues | null>(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const getRecords = async (page = 1) => {
    setLoading(true);
    setError(null);
    try {
      const url = new URL(indexPath, window.location.origin);
      url.searchParams.set("page", String(page));
      const response = await fetch(url);
      if (!response.ok) throw new Error("Failed to fetch records");
      const data = await response.json();
      setRecords(data.records);
      setPagination(data.pagination);
    } catch (e) {
      setError(e instanceof Error ? e.message : "Something went wrong");
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    getRecords();
  }, [indexPath]);

  return { records, pagination, loading, error, loadPage: getRecords };
}
