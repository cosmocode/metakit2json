#!/usr/bin/python

import sys
import json
import metakit


def main(filepath):
    db = metakit.storage(filepath, 0)
    meta = db.contents()

    for table in meta.structure():
        view = db.view(table.name)
        columns = [column.name for column in view.structure()]
        data = [{column: getattr(row, column) for column in columns} for row in view]

        with open('%s.json' % table.name, 'w') as fp:
            json.dump(data, fp, indent=2)


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print "no argument given"
        sys.exit(1)
    main(sys.argv[1])
