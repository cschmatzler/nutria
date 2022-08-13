# Introduction

Welcome to the documentation for Nutria.  

Nutria is my homelab, my playground, the tools I am using to manage my everyday life.

From the infrastructure side, it is a Kubernetes cluster with a highly available control plane, hosted on Hetzner and backed by Talos Linux. Setup is almost completely automated and the cluster is completely controlled with `just`, my favorite command runner.  
There are also some supporting nodes that host workloads not managed by Kubernetes.  

Workloads are managed by Flux. Workloads include both necessary infrastructure tools, such as ingress controller, DNS management, certificate management and backups, and also personal workloads with which I manage my life.  

This documentation describes decisions I've taken, from large decisions such as which hosting provider to use, down to detailed configuration decisions for specific services.
