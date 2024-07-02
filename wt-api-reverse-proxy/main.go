package main

// reverse proxy for the wt-api

import (
	"fmt"
	"log"
	"net/http"
	"net/http/httputil"
	"net/url"
	"os"
)

func main() {
	edgeIsolatedClusterCode := os.Getenv("EDGE_ISOLATED_CLUSTER_CODE")
	if edgeIsolatedClusterCode == "" {
		log.Fatal("EDGE_ISOLATED_CLUSTER_CODE is not set")
	}

	// create a new reverse proxy
	proxy := httputil.NewSingleHostReverseProxy(&url.URL{
		Scheme: "http",
		Host:   edgeIsolatedClusterCode + "-wt-api-agent.wt-system:8888",
	})
	// server
	http.Handle("/", proxy)
	fmt.Println("Server is running on port 8888")
	log.Fatal(http.ListenAndServe(":8888", nil))
}
