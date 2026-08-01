# AI contribution policy

MariaDB Server welcomes AI-assisted contributions. Code written with the help of AI tools is accepted on the same terms and to the same quality bar as any other contribution — it is reviewed the same way, and it must meet the same standards.

Four things are asked of anyone contributing AI-assisted work.

**Disclose it.** If an AI tool substantially helped write a contribution, say so with a commit trailer naming the tool and version. We follow [Linux kernel conventions](https://docs.kernel.org/process/coding-assistants.html):

    Assisted-by: Claude:claude-4.6-sonnet

Trivial assistance — autocompleting a variable name, suggesting a docstring, minor completions — does not need disclosure. The trailer follows the same 50/72 commit-message convention as `Reviewed-by:` — see the [Coding Style](https://mariadb.org/about/coding-style/) document.

**Stand behind it.** You are fully responsible for a contribution you submit with AI help, exactly as if you had written every line yourself. You must understand the code, be able to explain and debug it, and vouch for its correctness, quality, and licensing. AI assistance does not lower the bar or shift responsibility — the contributor is accountable for what they submit, however it was produced. A contribution the submitter cannot explain will not be accepted.

**You must have the right to contribute it (MCA).** By contributing, you certify under the MariaDB Contributor Agreement that you have the right to contribute the code, including any AI-assisted parts. If an AI tool's terms of use, or uncertainty about where its output came from, mean you cannot grant the rights the MCA requires, do not contribute that code. The MCA already asks you to certify this; AI assistance does not change what you must be able to certify, it only makes the check more important.

**Check its provenance.** Review AI-generated output with the same care as any other contribution, and make sure it does not introduce code you do not have the right to contribute — no third-party or incompatibly licensed material carried in from the tool. Where your AI tool offers a feature that flags output matching existing public code, enable it.

AI-assisted contributions are compatible with how MariaDB accepts code because responsibility for a contribution rests with the human who submits it, not with the tool. Disclosure keeps that honest; the MCA and provenance check keep it lawful; review keeps it safe.
