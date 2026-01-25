module.exports = {
  testEnvironment: "jsdom",
  roots: ["<rootDir>/app/javascript"],
  testMatch: ["**/*.test.{js,jsx,ts,tsx}", "**/*.spec.{js,jsx,ts,tsx}"],
  moduleNameMapper: {
    "\\.(css|less|scss|sass)$": "identity-obj-proxy",
    "^Atoms/(.*)$": "<rootDir>/app/javascript/components/atoms/$1",
    "^Molecules/(.*)$": "<rootDir>/app/javascript/components/molecules/$1",
    "^Organisms/(.*)$": "<rootDir>/app/javascript/components/organisms/$1",
    "^Types/(.*)$": "<rootDir>/app/javascript/types/$1",
  },
  setupFilesAfterEnv: ["<rootDir>/jest.setup.js"],
  transform: {
    "^.+\\.(js|jsx|ts|tsx)$": [
      "esbuild-jest",
      {
        sourcemap: true,
        loaders: {
          ".test.ts": "tsx",
          ".test.tsx": "tsx",
        },
      },
    ],
  },
  moduleFileExtensions: ["js", "jsx", "ts", "tsx", "json"],
  // Add test reporting for CircleCI
  reporters: [
    "default",
    [
      "jest-junit",
      {
        outputDirectory: "test-results/jest",
        outputName: "results.xml",
      },
    ],
  ],
  // Optional: coverage reporting
  collectCoverageFrom: [
    "app/javascript/**/*.{js,jsx,ts,tsx}",
    "!app/javascript/**/*.test.{js,jsx,ts,tsx}",
  ],
  coverageDirectory: "coverage",
};
