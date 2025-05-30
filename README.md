![Community-Project](https://gitlab.com/softbutterfly/open-source/open-source-office/-/raw/master/assets/dynova/dynova-open-source--banner--community-project.png)

![PyPI - Supported versions](https://img.shields.io/pypi/pyversions/pygments-sb-nrql)
![PyPI - Package version](https://img.shields.io/pypi/v/pygments-sb-nrql)
![PyPI - Downloads](https://img.shields.io/pypi/dm/pygments-sb-nrql)
![PyPI - MIT License](https://img.shields.io/pypi/l/pygments-sb-nrql)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/16c98dc02de142a195ae029ac9c441fd)](https://app.codacy.com/gh/dynovaio/newrelic-sb-nrql-pygments/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)
[![Codacy Badge](https://app.codacy.com/project/badge/Coverage/16c98dc02de142a195ae029ac9c441fd)](https://app.codacy.com/gh/dynovaio/newrelic-sb-nrql-pygments/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_coverage)
[![pipeline status](https://gitlab.com/softbutterfly/open-source/newrelic-sb-nrql-pygments/badges/master/pipeline.svg)](https://gitlab.com/softbutterfly/open-source/newrelic-sb-nrql-pygments/-/commits/master)

# Pygments SB NRQL

New Relic Query Language (NRQL) lexer for Pygments built by Dynova.

NRQL is a SQL-like query language you can use to query your data in New Relic.
This is a Python package that provides a lexer for Pygments to highlight NRQL
queries.

## Requirements

* Python 3.9.0 or higher

## Install

Install from PyPI

```bash
pip install pygments-sb-nrql
```

## Usage

Just install and create markdown blocks with the language `nrql` to get a
highlighted code block.

<pre>
```nrql
-- Example NRQL query
FROM
    Log
WITH
    numeric(http.statusCode) AS `sb.statusCode`,
    numeric(timespan) * 1000 AS `sb.duration`,
    capture(pageUrl, r'https://(?P<domain>[^/]+)/.+') AS `sb.domain`
SELECT
    average(`sb.duration`) AS 'Avg. Duration (s)'
WHERE
    entity.name = 'Sample Application' AND
    `sb.duration` > 0
FACET
    CASES(
        `sb.statusCode` < 400 AS 'Success',
        `sb.statusCode` < 500 AS 'Client Error',
        `sb.statusCode` < 600 AS 'Server Error'
    ) AS 'Status',
    `sb.domain` AS 'Domain'
TIMESERIES
    3 hours
SINCE
    '2024-10-01 00:00:00'
UNTIL
    '2024-11-01 00:00:00'
WITH TIMEZONE
    'America/LIMA'
COMPARE WITH
    1 month ago
```
</pre>

![Pygments SB NRQL](https://raw.githubusercontent.com/dynovaio/newrelic-sb-nrql-pygments/refs/heads/master/assets/newrelic-sb-nrql-pygments--example.png)

## Docs

* [Documentación](https://dynovaio.github.io/newrelic-sb-nrql-pygments)

## Changelog

All changes to versions of this library are listed in the [change history](./CHANGELOG.md).

## Development

Check out our [contribution guide](./CONTRIBUTING.md).

## Contributors

See the list of contributors [here](https://github.com/dynovaio/newrelic-sb-nrql-pygments/graphs/contributors).

## License

This project is licensed under the terms of the MIT license. See the
<a href="./LICENSE.txt" download>LICENSE</a> file.
