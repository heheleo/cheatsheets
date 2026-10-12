// A handy script that compiles all Typst files into a predefined
// output directory, maintaining the original directory structure.
// Run with bun compile_all.ts

import { exec } from "child_process";
import { readdir } from "fs/promises";
import { join } from "path";
import { promisify } from "util";

const INPUT_DIRECTORIES = ["calc2"];

const execAsync = promisify(exec);

async function compileFile(inputPath: string, outputPath: string) {
	try {
		await execAsync(`typst compile ${inputPath} ${outputPath} --root .`);
		console.log(`Compiled: ${inputPath} -> ${outputPath}`);
	} catch (error) {
		console.warn(`Failed to compile ${inputPath}:`, error);
	}
}

async function main() {
	for (const inputDir of INPUT_DIRECTORIES) {
		const files = await readdir(inputDir, { withFileTypes: true }).catch(
			() => {
				console.error(`Directory '${inputDir}' not found.`);
				return false;
			},
		);
		if (!files) continue;

		for (const file of files) {
			if (file.isFile() && file.name.endsWith(".typ")) {
				const inputPath = join(inputDir, file.name);
				const outputPath = join(
					inputDir,
					file.name.replace(/\.typ$/, ".pdf"),
				);
				await compileFile(inputPath, outputPath);
			}
		}
	}
}

main().catch((error) => {
	console.error("An error occurred during compilation:", error);
});
