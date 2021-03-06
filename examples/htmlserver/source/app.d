import diet.html;
import vibe.core.core;
import vibe.http.server;
import vibe.stream.wrapper;

void render(scope HTTPServerRequest req, scope HTTPServerResponse res)
{
	auto dst = streamOutputRange(res.bodyWriter);
	int iterations = 10;
	dst.compileHTMLDietFile!("index.dt", iterations);
}

void main()
{
	auto settings = new HTTPServerSettings;
	settings.bindAddresses = ["::1", "127.0.0.1"];
	settings.port = 8080;
	listenHTTP(settings, &render);

	runApplication();
}
