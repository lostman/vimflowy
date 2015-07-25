require 'coffee-script/register'
TestCase = require '../testcase.coffee'

# test swapping
t = new TestCase [
  { text: 'move', children: [
    'me'
  ] },
  'one',
  { text: 'uno', children: [
    'two'
    { text: 'dos', children: [
      'three'
      'tres'
    ] },
  ] },
  '...'
]
t.sendKey 'ctrl+j'
t.expect [
  'one',
  { text: 'move', children: [
    'me'
  ] },
  { text: 'uno', children: [
    'two'
    { text: 'dos', children: [
      'three'
      'tres'
    ] },
  ] },
  '...'
]
t.sendKey 'ctrl+j'
t.expect [
  'one',
  { text: 'uno', children: [
    { text: 'move', children: [
      'me'
    ] },
    'two'
    { text: 'dos', children: [
      'three'
      'tres'
    ] },
  ] },
  '...'
]
t.sendKey 'ctrl+j'
t.expect [
  'one',
  { text: 'uno', children: [
    'two'
    { text: 'move', children: [
      'me'
    ] },
    { text: 'dos', children: [
      'three'
      'tres'
    ] },
  ] },
  '...'
]
t.sendKey 'ctrl+j'
t.expect [
  'one',
  { text: 'uno', children: [
    'two'
    { text: 'dos', children: [
      { text: 'move', children: [
        'me'
      ] },
      'three'
      'tres'
    ] },
  ] },
  '...'
]
t.sendKey 'ctrl+j'
t.expect [
  'one',
  { text: 'uno', children: [
    'two'
    { text: 'dos', children: [
      'three'
      { text: 'move', children: [
        'me'
      ] },
      'tres'
    ] },
  ] },
  '...'
]
t.sendKey 'ctrl+j'
t.expect [
  'one',
  { text: 'uno', children: [
    'two'
    { text: 'dos', children: [
      'three'
      'tres'
      { text: 'move', children: [
        'me'
      ] },
    ] },
  ] },
  '...'
]
t.sendKey 'ctrl+j'
t.expect [
  'one',
  { text: 'uno', children: [
    'two'
    { text: 'dos', children: [
      'three'
      'tres'
    ] },
  ] },
  '...'
  { text: 'move', children: [
    'me'
  ] },
]

t.sendKey 'ctrl+j'
t.expect [
  'one',
  { text: 'uno', children: [
    'two'
    { text: 'dos', children: [
      'three'
      'tres'
    ] },
  ] },
  '...'
  { text: 'move', children: [
    'me'
  ] },
]

t.sendKey 'ctrl+k'
t.expect [
  'one',
  { text: 'uno', children: [
    'two'
    { text: 'dos', children: [
      'three'
      'tres'
    ] },
  ] },
  { text: 'move', children: [
    'me'
  ] },
  '...'
]

t.sendKey 'ctrl+k'
t.expect [
  'one',
  { text: 'uno', children: [
    'two'
    { text: 'dos', children: [
      'three'
      { text: 'move', children: [
        'me'
      ] },
      'tres'
    ] },
  ] },
  '...'
]
t.sendKey 'ctrl+k'
t.expect [
  'one',
  { text: 'uno', children: [
    'two'
    { text: 'dos', children: [
      { text: 'move', children: [
        'me'
      ] },
      'three'
      'tres'
    ] },
  ] },
  '...'
]
t.sendKey 'ctrl+k'
t.expect [
  'one',
  { text: 'uno', children: [
    'two'
    { text: 'move', children: [
      'me'
    ] },
    { text: 'dos', children: [
      'three'
      'tres'
    ] },
  ] },
  '...'
]
t.sendKey 'ctrl+k'
t.expect [
  'one',
  { text: 'uno', children: [
    { text: 'move', children: [
      'me'
    ] },
    'two'
    { text: 'dos', children: [
      'three'
      'tres'
    ] },
  ] },
  '...'
]
t.sendKey 'ctrl+k'
t.expect [
  'one',
  { text: 'move', children: [
    'me'
  ] },
  { text: 'uno', children: [
    'two'
    { text: 'dos', children: [
      'three'
      'tres'
    ] },
  ] },
  '...'
]
t.sendKey 'ctrl+k'
t.expect [
  { text: 'move', children: [
    'me'
  ] },
  'one',
  { text: 'uno', children: [
    'two'
    { text: 'dos', children: [
      'three'
      'tres'
    ] },
  ] },
  '...'
]
t.sendKey 'ctrl+k'
t.expect [
  { text: 'move', children: [
    'me'
  ] },
  'one',
  { text: 'uno', children: [
    'two'
    { text: 'dos', children: [
      'three'
      'tres'
    ] },
  ] },
  '...'
]

# test ctrl+h
t = new TestCase [
  { text: '1', children: [
    '2'
    { text: '3', children: [
      '4'
    ] },
    '5'
  ] },
]
t.sendKeys 'jj'
t.sendKey 'ctrl+h'
t.expect [
  { text: '1', children: [
    '2'
    '5'
  ] },
  { text: '3', children: [
    '4'
  ] },
]

# swap past collapsed makes sibling
t = new TestCase [
  'line'
  { text: '1', collapsed: true, children: [
    '2'
  ] },
]
t.sendKey 'ctrl+j'
t.expect [
  { text: '1', collapsed: true, children: [
    '2'
  ] },
  'line'
]

# indent uncollapses
t = new TestCase [
  { text: '1', collapsed: true, children: [
    '2'
  ] },
  '3'
]
t.sendKeys 'G>'
t.expect [
  { text: '1', children: [
    '2'
    '3'
  ] },
]

t = new TestCase [
  { text: '1', collapsed: true, children: [
    '2'
  ] },
  { text: '3', children: [
    '4'
  ] },
]
t.sendKeys 'j'
t.sendKey 'ctrl+l'
t.expect [
  { text: '1', children: [
    '2'
    { text: '3', children: [
      '4'
    ] },
  ] },
]

