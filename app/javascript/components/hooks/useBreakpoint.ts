import { useState, useEffect } from "react";

const BREAKPOINTS = {
  mobile: 768,
  tablet: 1024,
};

const useBreakpoint = () => {
  const getBreakpoint = () => {
    const width = window.innerWidth;
    if (width < BREAKPOINTS.mobile) return "mobile";
    if (width < BREAKPOINTS.tablet) return "tablet";
    return "desktop";
  };

  const [breakpoint, setBreakpoint] = useState(getBreakpoint);

  useEffect(() => {
    const queries = [
      window.matchMedia(`(max-width: ${BREAKPOINTS.mobile - 1}px)`),
      window.matchMedia(
        `(min-width: ${BREAKPOINTS.mobile}px) and (max-width: ${BREAKPOINTS.tablet - 1}px)`,
      ),
    ];

    const handler = () => setBreakpoint(getBreakpoint());
    queries.forEach((q) => q.addEventListener("change", handler));
    return () =>
      queries.forEach((q) => q.removeEventListener("change", handler));
  }, []);

  return {
    breakpoint,
    isMobile: breakpoint === "mobile",
    isTablet: breakpoint === "tablet",
    isDesktop: breakpoint === "desktop",
  };
};

export default useBreakpoint;
