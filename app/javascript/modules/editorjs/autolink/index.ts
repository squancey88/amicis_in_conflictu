import LinkAutocomplete from "@editorjs/link-autocomplete";

interface AutoLinkConfig {
  endpoint: string;
  queryParam: string;
  additionalParams?: Record<string, string>;
}

interface AutoLinkConstructorArgs {
  config: AutoLinkConfig;
  api: unknown;
}

interface SearchResponseItem {
  href: string;
  name: string;
}

interface SearchResponse {
  success: boolean;
  items: SearchResponseItem[];
}

// LinkAutocomplete doesn't ship types so we declare what we use
declare class LinkAutocompleteBase {
  config: AutoLinkConfig;
  searchQueryParam: string;
  searchEndpointUrl: string;
  constructor(args: AutoLinkConstructorArgs);
  searchRequest(searchString: string): Promise<SearchResponseItem[]>;
}

export default class AutoLink extends (LinkAutocomplete as unknown as typeof LinkAutocompleteBase) {
  private additionalParams: Record<string, string>;

  constructor({ config, api }: AutoLinkConstructorArgs) {
    super({ config, api });
    this.additionalParams = this.config.additionalParams ?? {};
  }

  async searchRequest(searchString: string): Promise<SearchResponseItem[]> {
    const query = new URLSearchParams({
      [this.searchQueryParam]: searchString,
    });

    Object.entries(this.additionalParams).forEach(([key, value]) => {
      query.set(key, value);
    });

    try {
      const searchResponseRaw = await fetch(
        `${this.searchEndpointUrl}?${query.toString()}`,
      );
      const searchResponse: SearchResponse = await searchResponseRaw.json();

      if (searchResponse?.success) {
        return searchResponse.items;
      } else {
        console.warn(
          'Link Autocomplete: invalid response format: "success: true" expected, but got %o. Response: %o',
          searchResponse.success,
          searchResponse,
        );
      }
    } catch (e) {
      console.error(`Search request error: ${(e as Error).message}`);
    }

    return [];
  }
}
