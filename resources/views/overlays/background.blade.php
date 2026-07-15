<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Fishing Overlay</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="{{ asset('css/background.css') }}" />
    </head>
    <body>
        <div class="overlay">
            <div class="frame">
                <header class="top-bar">
                    <div class="title-bar">
                        <div class="title-line"></div>
                    </div>
                </header>

                <main class="main-layout">
                    <section class="left-panel">
                        <div class="game-frame">
                            <div class="frame-top"></div>
                            <div class="frame-left"></div>
                            <div class="frame-right"></div>
                            <div class="frame-bottom"></div>
                            <div class="game-screen"></div>
                        </div>

                        <footer class="records">
                            <article class="record-card">
                                <span class="rivet tl"></span>
                                <span class="rivet tr"></span>
                                <span class="rivet bl"></span>
                                <span class="rivet br"></span>
                                <div class="record-content"></div>
                            </article>
                            <article class="record-card">
                                <span class="rivet tl"></span>
                                <span class="rivet tr"></span>
                                <span class="rivet bl"></span>
                                <span class="rivet br"></span>
                                <div class="record-content"></div>
                            </article>
                            <article class="record-card">
                                <span class="rivet tl"></span>
                                <span class="rivet tr"></span>
                                <span class="rivet bl"></span>
                                <span class="rivet br"></span>
                                <div class="record-content"></div>
                            </article>
                            <article class="record-card">
                                <span class="rivet tl"></span>
                                <span class="rivet tr"></span>
                                <span class="rivet bl"></span>
                                <span class="rivet br"></span>
                                <div class="record-content"></div>
                            </article>

                        </footer>
                    </section>

                    <aside class="right-panel">
                        <section class="tips-frame">
                            <div class="panel-header">Tips</div>
                            <div class="tips-body"></div>
                        </section>

                        <section class="chat-frame">
                            <div class="panel-header">Chat Log</div>
                            <div class="chat-body"></div>
                        </section>

                        <section class="avatar-frame">
                            <div class="panel-header">Guide</div>
                            <div class="avatar-body"></div>
                        </section>
                    </aside>
                </main>

            </div>
        </div>
    </body>
</html>
