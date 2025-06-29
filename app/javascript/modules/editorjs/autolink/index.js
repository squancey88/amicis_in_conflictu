import LinkAutocomplete from '@editorjs/link-autocomplete';
 
// Wanted to allow for additional Params to be included in the search
export default class AutoLink extends LinkAutocomplete {

  constructor({config, api}) {
    super({config, api});

    this.additionalParams = this.config.additionalParams;
  }

  async searchRequest(searchString) {
    /**
     * Compose query string
     *
     * @type {string}
     */
    const query = new URLSearchParams({ [this.searchQueryParam]: searchString });
    
    Object.entries(this.additionalParams).forEach(([key, value]) => {
      console.log(key, value);
      query.set(key, value);
    });

    try {
      /**
       * Get raw search data
       */
      const searchResponseRaw = await fetch(`${this.searchEndpointUrl}?${query.toString()}&mike=test`);

      /**
       * Get JSON decoded data
       */
      const searchResponse = await searchResponseRaw.json();

      if (searchResponse?.success) {
        return searchResponse.items;
      } else {
        console.warn('Link Autocomplete: invalid response format: "success: true" expected, but got %o. Response: %o', searchResponse.success, searchResponse);
      }
    } catch (e) {
      notifier.show({
        message: `${DICTIONARY.searchRequestError} "${e.message}"`,
        style: 'error',
      });
    }

    return [];
  }
}
