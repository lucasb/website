---
title: Post-Training Free Task Vectors
date: 2026-09-25
tags:
  - LLM
  - Safety
  - Artificial Behavioral
  - AI Control
draft: false
description: $[NeurIPS 2026 paper]$ TFTVs skip fine-tuning entirely by mapping contrastive activation steering directions directly into rank-one weight updates using only forward-pass statistics.
image: https://tftv-llm.github.io/figs/teaser-1.png
---


# Training-Free Task Vectors for Controlling LLM Behavior

I am excited to share our latest research, **"Training-Free Task Vectors for LLM Behavioral Control,"** which has been accepted at **NeurIPS 2026**!

In this paper, co-authored with Gabriel J. Perin, Lucas Boscaini, André Araujo, and Nina S. T. Hirata, we tackle a fundamental challenge in post-training model editing: *How can we permanently steer LLM behaviors without the heavy computational cost of fine-tuning?*

---

## The Problem: The High Cost of Classical Task Vectors

Task vectors have emerged as a powerful paradigm for model editing. Traditionally, a task vector is constructed by taking the parameter-level difference between a fine-tuned model and its base checkpoint ( $\Delta\theta = \theta_{\text{fine-tuned}} - \theta_{\text{base}}$ ).

These vectors exhibit intuitive vector arithmetic properties directly in weight space:
* **Addition:** Injecting or amplifying new capabilities and behaviors.
* **Subtraction:** Removing unwanted traits or safety hazards.
* **Composition:** Combining multiple task vectors to multi-steer a model simultaneously.

However, traditional task vectors have a glaring bottleneck: **they require fine-tuning first.** To control a behavior, you must first spend significant time and compute training a dedicated model checkpoint that expresses that behavior.

---

## The Solution: Training-Free Task Vectors (TFTV)

**Training-Free Task Vectors (TFTVs)** eliminate the fine-tuning requirement entirely.

Instead of subtracting weights from fine-tuned checkpoints, TFTV maps **activation-space steering directions** directly into **rank-one weight-space updates** using only forward-pass statistics from contrastive prompts.

$$\text{Contrastive Prompts} \longrightarrow \text{Activation Steering} \longrightarrow \text{Rank-1 Weight Update (TFTV)}$$

### Key Advantages of TFTV:

1. **Zero Fine-Tuning or Optimization:** TFTVs require only forward-pass statistics, making them orders of magnitude faster and cheaper to compute.
2. **Persistent Edits:** Unlike activation steering (which intervenes dynamically at every forward pass during inference), TFTVs directly modify the model's weights ($\theta_{\text{edited}} = \theta + \Delta\theta_{\text{TFTV}}$).
3. **Linear Weight Arithmetic:** TFTVs satisfy linear arithmetic properties in weight space, supporting:
   * **Learning via addition:** Amplifying desirable traits.
   * **Forgetting via subtraction:** Suppressing unwanted behaviors (e.g., toxicity, hallucination, sycophancy).
   * **Composition:** Combining multiple trait edits at once.

---

## Empirical Results

We evaluated TFTV across four instruction-tuned LLMs (including Llama-3.1-8B-Instruct) targeting traits such as toxicity/evilness, hallucination, and sycophancy.

A major highlight is **trait composition**:
* When applying a three-way suppression edit (suppressing evil, hallucination, and sycophancy simultaneously), TFTV reduces target trait scores to near zero.
* Crucially, TFTV achieves this while **preserving general reasoning utility** (maintaining baseline benchmark scores on MMLU and GSM8K), significantly outperforming traditional steering and weight-editing baselines.

---

## Read the Paper & Try the Code

* 📄 **arXiv Paper:** [Training-Free Task Vectors for LLM Behavioral Control (arXiv:2609.09054)](https://arxiv.org/abs/2609.09054)

* 🌐 **Project Website:** [tftv-llm.github.io](https://tftv-llm.github.io/)
* 💻 **Code & Demo:** Available on [GitHub](https://github.com/gabjp/training-free-task-vectors) and [Google Colab](https://colab.research.google.com/drive/1pc0OizU0zsUcZbbYlG25OoKnb608rIy2?usp=sharing)

---

*Feel free to check out the paper, try the Google Colab notebook, or reach out if you have thoughts or feedback on training-free post-training model control!*
