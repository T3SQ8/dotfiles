for path in '/home/user/notes/test'
    parents = os.path.dirname(path)
    if parents:
        os.makedirs(parents, exist_ok=True)
