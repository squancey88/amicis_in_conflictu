import { useState, useEffect } from "react";

const BREAKPOINTS = {
  mobile: 768,
  tablet: 1024,
};

const useBreakpoint = () => {
  const getBreakpoint = () => {
    if (typeof window === "undefined") return "desktop";
    const width = window.innerWidth;
    if (width < BREAKPOINTS.mobile) return "mobile";
    if (width < BREAKPOINTS.tablet) return "tablet";
    return "desktop";
  };

  const [breakpoint, setBreakpoint] = useState(getBreakpoint);

  useEffect(() => {
    const handler = () => setBreakpoint(getBreakpoint());
    window.addEventListener("resize", handler);
    handler(); // sync in case viewport changed between initial render and mount
    return () => window.removeEventListener("resize", handler);
  }, []);

  return {
    breakpoint,
    isMobile: breakpoint === "mobile",
    isTablet: breakpoint === "tablet",
    isDesktop: breakpoint === "desktop",
  };
};

export default useBreakpoint;
