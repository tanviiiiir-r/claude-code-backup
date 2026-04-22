# Python Rules

- Type hints: def f(x: int) -> str:
- Use dataclasses over dicts
- Use pathlib over os.path
- Context managers for resources
- f-strings over .format()
- Walrus for regex: if m := re.search(p, t):

Avoid:
- eval/exec with user input
- subprocess(shell=True)
- pickle.loads(untrusted)