<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@picocss/pico@1/css/pico.min.css">
</head>
<body>
    <main class="container">
        <h1>My Posts</h1>

        <form method="POST" action="/posts">
            @csrf
            <label> New post </label>
            <input type="text" placeholder="Title" name="title">
            <input type="text" placeholder="Type your post text here..." name="content">
            <input type="submit" value="Submit" />
        </form>

        @foreach ($posts as $post)
            <article>
                <h3>{{ $post->title }}</h3>
                <p>{{ $post->content }}</p>

                <form method="POST" action="/posts/{{ $post->id }}">
                    @method('delete')
                    @csrf
                    <input type="submit" value="Delete" />
                </form>
            </article>
        @endforeach
    </main>
</body>
</html>
