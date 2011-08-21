Feature: code-breaker submits guess

  The code-breaker submits a guess of four numbers.  The game marks the guess with + and - signs.
  For each number in the guess that matches the number and position of a number in the secret code, the
  mark includes one + sign.
  For each number in the guess that matches the number but not the position of a number in the secret code, the
  mark includes one - sign.

  Each position in the secret code can only be matched once.  For example, a guess of 1134 against a secret code of 1234
  would get three plus signs: one for each of the exact matches in the first, third and fourth positions.  The number
  match in the second position would be ignored.

  Scenario Outline: submit guess
    Given the secret code is "<code>"
    When I guess "<guess>"
    Then the mark should be "<mark>"

    Scenarios: no matches
    | code | guess | mark |
    | 1234 | 5555  |      |

    Scenarios: 1 numbers correct
    | code  | guess | mark  |
    | 1234  | 1555  | +     |
    | 1234  | 2555  | -     |

    Scenarios: 2 numbers correct
    | code  | guess | mark  |
    | 1234  | 1554  | ++    |
    | 1234  | 1545  | +-    |
    | 1234  | 2355  | --    |

    Scenarios: 3 numbers correct
    | code  | guess | mark  |
    | 1234  | 1534  | +++   |
    | 1234  | 1354  | ++-   |
    | 1234  | 5432  | +--   |
    | 1234  | 4125  | ---   |

    Scenarios: 4 numbers correct
    | code  | guess | mark  |
    | 1234  | 1234  | ++++  |
    | 1234  | 1243  | ++--  |
    | 1234  | 1342  | +---  |
    | 1234  | 2341  | ----  |

    Scenarios: matchies with duplicates
    | code  | guess | mark  |
    | 1234  | 1155  | +     |
    | 1234  | 5115  | -     |
    | 1134  | 1155  | ++    |
    | 1134  | 5115  | +-    |
    | 1134  | 5511  | --    |
    | 1134  | 1115  | ++    |
    | 1134  | 5111  | +-    |




