FROM hayd/alpine-deno:1.2.0

# This command will download all the necessary files and cache them 
# so they are not downloaded again when the application is restarted.
RUN deno run https://raw.fastro.dev/v0.13.15/deps.ts
RUN deno run https://raw.fastro.dev/v0.13.15/mod.ts
RUN deno run https://raw.fastro.dev/v0.13.15/core/server.ts
RUN deno run https://raw.fastro.dev/v0.14.2/cli/fastro.ts

WORKDIR /app

COPY . ./

CMD ["run", "-A", "https://raw.fastro.dev/v0.14.2/cli/fastro.ts", "serve", "--port", "8080"]