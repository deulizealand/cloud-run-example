import { Request } from "https://raw.fastro.dev/v0.14.2/mod.ts";
import { getMessage } from "../services/message_service.ts";

export function handler(req: Request) {
  const { message } = getMessage();
  req.send(message);
}
