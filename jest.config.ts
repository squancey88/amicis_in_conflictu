import type { Config } from "jest";

const config: Config = {
  testEnvironment: "jsdom",
  roots: ["<rootDir>/app/javascript"],
  testMatch: ["**/*.test.{js,jsx,ts,tsx}", "**/*.spec.{js,jsx,ts,tsx}"],
  moduleNameMapper: {
    "\\.(css|less|scss|sass)$": "identity-obj-proxy",
    "^Atoms/(.*)$": "<rootDir>/app/javascript/components/atoms/$1",
    "^Molecules/(.*)$": "<rootDir>/app/javascript/components/molecules/$1",
    "^Organisms/(.*)$": "<rootDir>/app/javascript/components/organisms/$1",
    "^Types/(.*)$": "<rootDir>/app/javascript/types/$1",
    "^Modules/(.*)$": "<rootDir>/app/javascript/modules/$1",
  },
  setupFilesAfterEnv: ["<rootDir>/jest.setup.ts"],
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
  transformIgnorePatterns: ["node_modules/(?!(@dnd-kit|@preact)/)"],
  moduleFileExtensions: ["js", "jsx", "ts", "tsx", "json"],
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
  collectCoverageFrom: [
    "app/javascript/**/*.{js,jsx,ts,tsx}",
    "!app/javascript/**/*.test.{js,jsx,ts,tsx}",
  ],
  coverageDirectory: "coverage",
};

export default config;
