deploy_repo_url = git@github.com:kevcisme/docker-pelican.git

docker-build:
	docker build -t kevcisme/pelican .
	mkdir website/content
	mkdir website/output
docker-kill:
	docker stop pelican
	docker rm pelican

docker-run:
	docker run --name="pelican" -d -v $(CURDIR)/website:/srv/pelican-website -p 8000:8000 kevcisme/pelican

docker-bash:
	docker run --name="pelican" -i -t -v $(CURDIR)/website:/srv/pelican-website -p 8000:8000 kevcisme/pelican /bin/bash
 
pelican-github-user-page: 
	docker run -d -v $(CURDIR)/website:/srv/pelican-website kevcisme/pelican ghp-import output
	git push $(deploy_repo_url) gh-pages:master

pelican-github-project-page:
	docker run -i -t -v $(CURDIR)/website:/srv/pelican-website kevcisme/pelican make github
